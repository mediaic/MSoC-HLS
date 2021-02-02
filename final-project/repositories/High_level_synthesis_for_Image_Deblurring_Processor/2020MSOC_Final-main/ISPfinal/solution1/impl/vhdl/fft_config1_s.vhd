-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.2 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================

library ieee;
use ieee.std_logic_1164.all;

entity fft_config1_s is
    generic (
        INPUT_WIDTH  : integer := 64;
        OUTPUT_WIDTH : integer := 64;
        CONFIG_WIDTH : integer := 16;
        STATUS_WIDTH : integer := 8
    );
    port (
        ap_clk                         : in  std_logic;
        ap_rst                         : in  std_logic;
        ap_start                       : in  std_logic;
        ap_continue                    : in  std_logic;
        ap_ce                          : in  std_logic;
        ap_done                        : out std_logic;
        ap_ready                       : out std_logic;
        ap_idle                        : out std_logic;
        config_ch_data_V_dout            : in  std_logic_vector(CONFIG_WIDTH-1 downto 0);
        config_ch_data_V_empty_n     : in  std_logic;
        config_ch_data_V_read        : out std_logic;
        xn_dout       : in  std_logic_vector(INPUT_WIDTH-1 downto 0);
        xn_empty_n            : in  std_logic;
        xn_read               : out std_logic;
        xk_din      : out std_logic_vector(OUTPUT_WIDTH-1 downto 0);
        xk_full_n             : in  std_logic;
        xk_write              : out std_logic;
        status_data_V_din                  : out std_logic_vector(STATUS_WIDTH-1 downto 0);
        status_data_V_full_n                : in  std_logic;
        status_data_V_write                 : out std_logic
    );
end entity;

architecture arch of fft_config1_s is
    --------------------- Component ---------------------
    component fft_config1_s_core is
        port (
            aclk                        : in  std_logic;
            aclken                      : in  std_logic;
            aresetn                     : in  std_logic;
            s_axis_config_tdata         : in  std_logic_vector(CONFIG_WIDTH-1 downto 0);
            s_axis_config_tvalid        : in  std_logic;
            s_axis_config_tready        : out std_logic;
            s_axis_data_tdata           : in  std_logic_vector(INPUT_WIDTH-1 downto 0);
            s_axis_data_tvalid          : in  std_logic;
            s_axis_data_tready          : out std_logic;
            s_axis_data_tlast           : in  std_logic;
            m_axis_data_tdata           : out std_logic_vector(OUTPUT_WIDTH-1 downto 0);
            m_axis_data_tuser           : out std_logic_vector(STATUS_WIDTH-1 downto 0);
            m_axis_data_tvalid          : out std_logic;
            m_axis_data_tready          : in  std_logic;
            m_axis_data_tlast           : out std_logic;
            m_axis_status_tdata         : out std_logic_vector(STATUS_WIDTH-1 downto 0);
            m_axis_status_tvalid        : out std_logic;
            m_axis_status_tready        : in  std_logic;
            event_frame_started         : out std_logic;
            event_tlast_unexpected      : out std_logic;
            event_tlast_missing         : out std_logic;
            event_status_channel_halt   : out std_logic;
            event_data_in_channel_halt  : out std_logic;
            event_data_out_channel_halt : out std_logic
        );
    end component;
    --------------------- Local signal ------------------
    signal aresetn       : std_logic;
    signal config_tready : std_logic;
    signal xn_tready     : std_logic;
    signal xk_tvalid     : std_logic;
    signal xk_tlast      : std_logic;
    signal status_tvalid : std_logic;
    signal ap_done_i     : std_logic;
    signal xk_full_n_i   : std_logic;
    signal xn_empty_n_i  : std_logic;
begin
    --------------------- Instantiation -----------------
    inst : component fft_config1_s_core
    port map (
        aclk                        => ap_clk,
        aclken                      => ap_ce,
        aresetn                     => aresetn,
        s_axis_config_tdata         => config_ch_data_V_dout,
        s_axis_config_tvalid        => config_ch_data_V_empty_n,
        s_axis_config_tready        => config_tready,
        s_axis_data_tdata           => xn_dout,
        s_axis_data_tvalid          => xn_empty_n_i,
        s_axis_data_tready          => xn_tready,
        s_axis_data_tlast           => '0',
        m_axis_data_tdata           => xk_din,
        m_axis_data_tuser           => open,
        m_axis_data_tvalid          => xk_tvalid,
        m_axis_data_tready          => xk_full_n_i,
        m_axis_data_tlast           => xk_tlast,
        m_axis_status_tdata         => status_data_V_din,
        m_axis_status_tvalid        => status_tvalid,
        m_axis_status_tready        => status_data_V_full_n,
        event_frame_started         => open,
        event_tlast_unexpected      => open,
        event_tlast_missing         => open,
        event_status_channel_halt   => open,
        event_data_in_channel_halt  => open,
        event_data_out_channel_halt => open
    );

    --------------------- Assignment --------------------
    ap_done                  <= ap_done_i;
    aresetn                  <= ap_rst xor '1';
    config_ch_data_V_read  <= ap_ce and config_ch_data_V_empty_n and config_tready;
    xn_read         <= ap_ce and xn_empty_n_i and xn_tready;
    xn_empty_n_i    <= xn_empty_n and ap_start;
    xk_write        <= ap_ce and xk_full_n_i and xk_tvalid;
    xk_full_n_i     <= xk_full_n and (not ap_done_i or ap_continue);
    status_data_V_write           <= ap_ce and status_data_V_full_n and status_tvalid;

    process (ap_clk) begin
        if ap_clk'event and ap_clk = '1' then
            if ap_rst = '1' then
                ap_done_i <= '0';
            elsif ap_ce = '1' then
                if xk_full_n_i = '1' and xk_tvalid = '1' and xk_tlast = '1' then
                    ap_done_i <= '1';
                elsif ap_continue = '1' then
                    ap_done_i <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ap_clk) begin
        if ap_clk'event and ap_clk = '1' then
            if ap_rst = '1' then
                ap_ready <= '0';
            elsif ap_ce = '1' then
                if xk_full_n_i = '1' and xk_tvalid = '1' and xk_tlast = '1' then
                    ap_ready <= '1';
                else
                    ap_ready <= '0';
                end if;
            end if;
        end if;
    end process;
end architecture;
