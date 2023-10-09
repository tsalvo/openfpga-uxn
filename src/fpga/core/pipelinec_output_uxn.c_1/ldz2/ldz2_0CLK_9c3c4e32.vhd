-- Timing params:
--   Fixed?: True
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 94
entity ldz2_0CLK_9c3c4e32 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldz2_0CLK_9c3c4e32;
architecture arch of ldz2_0CLK_9c3c4e32 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1670_c6_cb1d]
signal BIN_OP_EQ_uxn_opcodes_h_l1670_c6_cb1d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1670_c6_cb1d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1670_c6_cb1d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1670_c1_ccf6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_ccf6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_ccf6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_ccf6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_ccf6_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1670_c2_6968]
signal t8_MUX_uxn_opcodes_h_l1670_c2_6968_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1670_c2_6968_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1670_c2_6968]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1670_c2_6968_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1670_c2_6968_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1670_c2_6968]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_6968_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_6968_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1670_c2_6968]
signal result_stack_value_MUX_uxn_opcodes_h_l1670_c2_6968_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1670_c2_6968_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1670_c2_6968]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_6968_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_6968_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1670_c2_6968]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_6968_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_6968_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1670_c2_6968]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_6968_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_6968_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1670_c2_6968]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1670_c2_6968_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1670_c2_6968_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1670_c2_6968]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_6968_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_6968_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1670_c2_6968]
signal result_ram_addr_MUX_uxn_opcodes_h_l1670_c2_6968_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1670_c2_6968_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1670_c2_6968]
signal tmp16_MUX_uxn_opcodes_h_l1670_c2_6968_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1670_c2_6968_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1671_c3_9980[uxn_opcodes_h_l1671_c3_9980]
signal printf_uxn_opcodes_h_l1671_c3_9980_uxn_opcodes_h_l1671_c3_9980_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1676_c11_cfec]
signal BIN_OP_EQ_uxn_opcodes_h_l1676_c11_cfec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1676_c11_cfec_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1676_c11_cfec_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1676_c7_51e5]
signal t8_MUX_uxn_opcodes_h_l1676_c7_51e5_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1676_c7_51e5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1676_c7_51e5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1676_c7_51e5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1676_c7_51e5]
signal result_stack_value_MUX_uxn_opcodes_h_l1676_c7_51e5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1676_c7_51e5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1676_c7_51e5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_51e5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1676_c7_51e5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_51e5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1676_c7_51e5]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1676_c7_51e5_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1676_c7_51e5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_51e5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1676_c7_51e5]
signal result_ram_addr_MUX_uxn_opcodes_h_l1676_c7_51e5_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1676_c7_51e5]
signal tmp16_MUX_uxn_opcodes_h_l1676_c7_51e5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1679_c11_fa13]
signal BIN_OP_EQ_uxn_opcodes_h_l1679_c11_fa13_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1679_c11_fa13_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1679_c11_fa13_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1679_c7_fcba]
signal t8_MUX_uxn_opcodes_h_l1679_c7_fcba_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1679_c7_fcba]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1679_c7_fcba_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1679_c7_fcba]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1679_c7_fcba]
signal result_stack_value_MUX_uxn_opcodes_h_l1679_c7_fcba_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1679_c7_fcba]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1679_c7_fcba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_fcba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1679_c7_fcba]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_fcba_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1679_c7_fcba]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1679_c7_fcba_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1679_c7_fcba]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_fcba_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1679_c7_fcba]
signal result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_fcba_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1679_c7_fcba]
signal tmp16_MUX_uxn_opcodes_h_l1679_c7_fcba_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1683_c32_ea0b]
signal BIN_OP_AND_uxn_opcodes_h_l1683_c32_ea0b_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1683_c32_ea0b_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1683_c32_ea0b_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1683_c32_f852]
signal BIN_OP_GT_uxn_opcodes_h_l1683_c32_f852_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1683_c32_f852_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1683_c32_f852_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1683_c32_eb85]
signal MUX_uxn_opcodes_h_l1683_c32_eb85_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1683_c32_eb85_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1683_c32_eb85_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1683_c32_eb85_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1687_c11_27f0]
signal BIN_OP_EQ_uxn_opcodes_h_l1687_c11_27f0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1687_c11_27f0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1687_c11_27f0_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1687_c7_1e77]
signal result_ram_addr_MUX_uxn_opcodes_h_l1687_c7_1e77_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1687_c7_1e77]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1687_c7_1e77_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1687_c7_1e77]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1687_c7_1e77_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1687_c7_1e77]
signal result_stack_value_MUX_uxn_opcodes_h_l1687_c7_1e77_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1687_c7_1e77]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_1e77_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1687_c7_1e77]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_1e77_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1687_c7_1e77]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1687_c7_1e77_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1687_c7_1e77]
signal tmp16_MUX_uxn_opcodes_h_l1687_c7_1e77_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1691_c11_3ba1]
signal BIN_OP_EQ_uxn_opcodes_h_l1691_c11_3ba1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1691_c11_3ba1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1691_c11_3ba1_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1691_c7_9380]
signal result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_9380_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_9380_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1691_c7_9380]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1691_c7_9380_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1691_c7_9380_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1691_c7_9380]
signal result_stack_value_MUX_uxn_opcodes_h_l1691_c7_9380_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1691_c7_9380_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1691_c7_9380]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1691_c7_9380_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1691_c7_9380_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1691_c7_9380]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_9380_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_9380_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1691_c7_9380]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_9380_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_9380_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1691_c7_9380]
signal tmp16_MUX_uxn_opcodes_h_l1691_c7_9380_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1691_c7_9380_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1693_c3_142a]
signal CONST_SL_8_uxn_opcodes_h_l1693_c3_142a_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1693_c3_142a_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1694_c32_b34b]
signal BIN_OP_PLUS_uxn_opcodes_h_l1694_c32_b34b_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1694_c32_b34b_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1694_c32_b34b_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1696_c11_5c0f]
signal BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5c0f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5c0f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5c0f_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1696_c7_f917]
signal result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_f917_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_f917_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1696_c7_f917]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1696_c7_f917_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1696_c7_f917_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1696_c7_f917]
signal result_stack_value_MUX_uxn_opcodes_h_l1696_c7_f917_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1696_c7_f917_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1696_c7_f917]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f917_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f917_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1696_c7_f917]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f917_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f917_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1696_c7_f917]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f917_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f917_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1696_c7_f917]
signal tmp16_MUX_uxn_opcodes_h_l1696_c7_f917_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1696_c7_f917_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1697_c32_d4fd]
signal BIN_OP_PLUS_uxn_opcodes_h_l1697_c32_d4fd_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1697_c32_d4fd_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1697_c32_d4fd_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1699_c11_855c]
signal BIN_OP_EQ_uxn_opcodes_h_l1699_c11_855c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1699_c11_855c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1699_c11_855c_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1699_c7_8a7c]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1699_c7_8a7c_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1699_c7_8a7c_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1699_c7_8a7c_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1699_c7_8a7c]
signal result_stack_value_MUX_uxn_opcodes_h_l1699_c7_8a7c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1699_c7_8a7c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1699_c7_8a7c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1699_c7_8a7c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_8a7c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_8a7c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_8a7c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1699_c7_8a7c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_8a7c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_8a7c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_8a7c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1699_c7_8a7c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_8a7c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_8a7c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_8a7c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1699_c7_8a7c]
signal tmp16_MUX_uxn_opcodes_h_l1699_c7_8a7c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1699_c7_8a7c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1699_c7_8a7c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1700_c3_696e]
signal BIN_OP_OR_uxn_opcodes_h_l1700_c3_696e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1700_c3_696e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1700_c3_696e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1706_c11_4c50]
signal BIN_OP_EQ_uxn_opcodes_h_l1706_c11_4c50_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1706_c11_4c50_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1706_c11_4c50_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1706_c7_70ed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_70ed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_70ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_70ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_70ed_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1706_c7_70ed]
signal result_stack_value_MUX_uxn_opcodes_h_l1706_c7_70ed_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1706_c7_70ed_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1706_c7_70ed_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1706_c7_70ed_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1706_c7_70ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_70ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_70ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_70ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_70ed_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1706_c7_70ed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_70ed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_70ed_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_70ed_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_70ed_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1708_c34_7d20]
signal CONST_SR_8_uxn_opcodes_h_l1708_c34_7d20_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1708_c34_7d20_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1710_c11_68f8]
signal BIN_OP_EQ_uxn_opcodes_h_l1710_c11_68f8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1710_c11_68f8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1710_c11_68f8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1710_c7_e38b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_e38b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_e38b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_e38b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_e38b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1710_c7_e38b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_e38b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_e38b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_e38b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_e38b_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint9_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(8 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_c22c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_ram_read := ref_toks_7;
      base.is_stack_write := ref_toks_8;
      base.ram_addr := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1670_c6_cb1d
BIN_OP_EQ_uxn_opcodes_h_l1670_c6_cb1d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1670_c6_cb1d_left,
BIN_OP_EQ_uxn_opcodes_h_l1670_c6_cb1d_right,
BIN_OP_EQ_uxn_opcodes_h_l1670_c6_cb1d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_ccf6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_ccf6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_ccf6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_ccf6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_ccf6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_ccf6_return_output);

-- t8_MUX_uxn_opcodes_h_l1670_c2_6968
t8_MUX_uxn_opcodes_h_l1670_c2_6968 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1670_c2_6968_cond,
t8_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue,
t8_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse,
t8_MUX_uxn_opcodes_h_l1670_c2_6968_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1670_c2_6968
result_is_stack_read_MUX_uxn_opcodes_h_l1670_c2_6968 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1670_c2_6968_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1670_c2_6968_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_6968
result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_6968 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_6968_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_6968_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1670_c2_6968
result_stack_value_MUX_uxn_opcodes_h_l1670_c2_6968 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1670_c2_6968_cond,
result_stack_value_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1670_c2_6968_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_6968
result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_6968 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_6968_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_6968_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_6968
result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_6968 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_6968_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_6968_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_6968
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_6968 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_6968_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_6968_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1670_c2_6968
result_is_ram_read_MUX_uxn_opcodes_h_l1670_c2_6968 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1670_c2_6968_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1670_c2_6968_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_6968
result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_6968 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_6968_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_6968_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1670_c2_6968
result_ram_addr_MUX_uxn_opcodes_h_l1670_c2_6968 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1670_c2_6968_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1670_c2_6968_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1670_c2_6968
tmp16_MUX_uxn_opcodes_h_l1670_c2_6968 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1670_c2_6968_cond,
tmp16_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue,
tmp16_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse,
tmp16_MUX_uxn_opcodes_h_l1670_c2_6968_return_output);

-- printf_uxn_opcodes_h_l1671_c3_9980_uxn_opcodes_h_l1671_c3_9980
printf_uxn_opcodes_h_l1671_c3_9980_uxn_opcodes_h_l1671_c3_9980 : entity work.printf_uxn_opcodes_h_l1671_c3_9980_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1671_c3_9980_uxn_opcodes_h_l1671_c3_9980_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1676_c11_cfec
BIN_OP_EQ_uxn_opcodes_h_l1676_c11_cfec : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1676_c11_cfec_left,
BIN_OP_EQ_uxn_opcodes_h_l1676_c11_cfec_right,
BIN_OP_EQ_uxn_opcodes_h_l1676_c11_cfec_return_output);

-- t8_MUX_uxn_opcodes_h_l1676_c7_51e5
t8_MUX_uxn_opcodes_h_l1676_c7_51e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1676_c7_51e5_cond,
t8_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue,
t8_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse,
t8_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1676_c7_51e5
result_is_stack_read_MUX_uxn_opcodes_h_l1676_c7_51e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1676_c7_51e5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c7_51e5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c7_51e5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1676_c7_51e5
result_stack_value_MUX_uxn_opcodes_h_l1676_c7_51e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1676_c7_51e5_cond,
result_stack_value_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c7_51e5
result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c7_51e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_51e5
result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_51e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_51e5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_51e5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_51e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_51e5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1676_c7_51e5
result_is_ram_read_MUX_uxn_opcodes_h_l1676_c7_51e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1676_c7_51e5_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_51e5
result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_51e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_51e5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1676_c7_51e5
result_ram_addr_MUX_uxn_opcodes_h_l1676_c7_51e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1676_c7_51e5_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1676_c7_51e5
tmp16_MUX_uxn_opcodes_h_l1676_c7_51e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1676_c7_51e5_cond,
tmp16_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue,
tmp16_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse,
tmp16_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1679_c11_fa13
BIN_OP_EQ_uxn_opcodes_h_l1679_c11_fa13 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1679_c11_fa13_left,
BIN_OP_EQ_uxn_opcodes_h_l1679_c11_fa13_right,
BIN_OP_EQ_uxn_opcodes_h_l1679_c11_fa13_return_output);

-- t8_MUX_uxn_opcodes_h_l1679_c7_fcba
t8_MUX_uxn_opcodes_h_l1679_c7_fcba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1679_c7_fcba_cond,
t8_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue,
t8_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse,
t8_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1679_c7_fcba
result_is_stack_read_MUX_uxn_opcodes_h_l1679_c7_fcba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1679_c7_fcba_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1679_c7_fcba
result_sp_relative_shift_MUX_uxn_opcodes_h_l1679_c7_fcba : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1679_c7_fcba
result_stack_value_MUX_uxn_opcodes_h_l1679_c7_fcba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1679_c7_fcba_cond,
result_stack_value_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1679_c7_fcba
result_is_sp_shift_MUX_uxn_opcodes_h_l1679_c7_fcba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_fcba
result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_fcba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_fcba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_fcba
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_fcba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_fcba_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1679_c7_fcba
result_is_ram_read_MUX_uxn_opcodes_h_l1679_c7_fcba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1679_c7_fcba_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_fcba
result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_fcba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_fcba_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_fcba
result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_fcba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_fcba_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1679_c7_fcba
tmp16_MUX_uxn_opcodes_h_l1679_c7_fcba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1679_c7_fcba_cond,
tmp16_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue,
tmp16_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse,
tmp16_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1683_c32_ea0b
BIN_OP_AND_uxn_opcodes_h_l1683_c32_ea0b : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1683_c32_ea0b_left,
BIN_OP_AND_uxn_opcodes_h_l1683_c32_ea0b_right,
BIN_OP_AND_uxn_opcodes_h_l1683_c32_ea0b_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1683_c32_f852
BIN_OP_GT_uxn_opcodes_h_l1683_c32_f852 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1683_c32_f852_left,
BIN_OP_GT_uxn_opcodes_h_l1683_c32_f852_right,
BIN_OP_GT_uxn_opcodes_h_l1683_c32_f852_return_output);

-- MUX_uxn_opcodes_h_l1683_c32_eb85
MUX_uxn_opcodes_h_l1683_c32_eb85 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1683_c32_eb85_cond,
MUX_uxn_opcodes_h_l1683_c32_eb85_iftrue,
MUX_uxn_opcodes_h_l1683_c32_eb85_iffalse,
MUX_uxn_opcodes_h_l1683_c32_eb85_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1687_c11_27f0
BIN_OP_EQ_uxn_opcodes_h_l1687_c11_27f0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1687_c11_27f0_left,
BIN_OP_EQ_uxn_opcodes_h_l1687_c11_27f0_right,
BIN_OP_EQ_uxn_opcodes_h_l1687_c11_27f0_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1687_c7_1e77
result_ram_addr_MUX_uxn_opcodes_h_l1687_c7_1e77 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1687_c7_1e77_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1687_c7_1e77
result_is_ram_read_MUX_uxn_opcodes_h_l1687_c7_1e77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1687_c7_1e77_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1687_c7_1e77
result_is_sp_shift_MUX_uxn_opcodes_h_l1687_c7_1e77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1687_c7_1e77_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1687_c7_1e77
result_stack_value_MUX_uxn_opcodes_h_l1687_c7_1e77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1687_c7_1e77_cond,
result_stack_value_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_1e77
result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_1e77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_1e77_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_1e77
result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_1e77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_1e77_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1687_c7_1e77
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1687_c7_1e77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1687_c7_1e77_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1687_c7_1e77
tmp16_MUX_uxn_opcodes_h_l1687_c7_1e77 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1687_c7_1e77_cond,
tmp16_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue,
tmp16_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse,
tmp16_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1691_c11_3ba1
BIN_OP_EQ_uxn_opcodes_h_l1691_c11_3ba1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1691_c11_3ba1_left,
BIN_OP_EQ_uxn_opcodes_h_l1691_c11_3ba1_right,
BIN_OP_EQ_uxn_opcodes_h_l1691_c11_3ba1_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_9380
result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_9380 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_9380_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_9380_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1691_c7_9380
result_is_ram_read_MUX_uxn_opcodes_h_l1691_c7_9380 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1691_c7_9380_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1691_c7_9380_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1691_c7_9380
result_stack_value_MUX_uxn_opcodes_h_l1691_c7_9380 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1691_c7_9380_cond,
result_stack_value_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1691_c7_9380_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1691_c7_9380
result_is_stack_write_MUX_uxn_opcodes_h_l1691_c7_9380 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1691_c7_9380_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1691_c7_9380_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_9380
result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_9380 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_9380_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_9380_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_9380
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_9380 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_9380_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_9380_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1691_c7_9380
tmp16_MUX_uxn_opcodes_h_l1691_c7_9380 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1691_c7_9380_cond,
tmp16_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue,
tmp16_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse,
tmp16_MUX_uxn_opcodes_h_l1691_c7_9380_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1693_c3_142a
CONST_SL_8_uxn_opcodes_h_l1693_c3_142a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1693_c3_142a_x,
CONST_SL_8_uxn_opcodes_h_l1693_c3_142a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1694_c32_b34b
BIN_OP_PLUS_uxn_opcodes_h_l1694_c32_b34b : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1694_c32_b34b_left,
BIN_OP_PLUS_uxn_opcodes_h_l1694_c32_b34b_right,
BIN_OP_PLUS_uxn_opcodes_h_l1694_c32_b34b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5c0f
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5c0f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5c0f_left,
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5c0f_right,
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5c0f_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_f917
result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_f917 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_f917_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_f917_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1696_c7_f917
result_is_ram_read_MUX_uxn_opcodes_h_l1696_c7_f917 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1696_c7_f917_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1696_c7_f917_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1696_c7_f917
result_stack_value_MUX_uxn_opcodes_h_l1696_c7_f917 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1696_c7_f917_cond,
result_stack_value_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1696_c7_f917_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f917
result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f917 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f917_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f917_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f917
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f917 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f917_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f917_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f917
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f917 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f917_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f917_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1696_c7_f917
tmp16_MUX_uxn_opcodes_h_l1696_c7_f917 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1696_c7_f917_cond,
tmp16_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue,
tmp16_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse,
tmp16_MUX_uxn_opcodes_h_l1696_c7_f917_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1697_c32_d4fd
BIN_OP_PLUS_uxn_opcodes_h_l1697_c32_d4fd : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1697_c32_d4fd_left,
BIN_OP_PLUS_uxn_opcodes_h_l1697_c32_d4fd_right,
BIN_OP_PLUS_uxn_opcodes_h_l1697_c32_d4fd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1699_c11_855c
BIN_OP_EQ_uxn_opcodes_h_l1699_c11_855c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1699_c11_855c_left,
BIN_OP_EQ_uxn_opcodes_h_l1699_c11_855c_right,
BIN_OP_EQ_uxn_opcodes_h_l1699_c11_855c_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1699_c7_8a7c
result_is_ram_read_MUX_uxn_opcodes_h_l1699_c7_8a7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1699_c7_8a7c_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1699_c7_8a7c_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1699_c7_8a7c_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1699_c7_8a7c
result_stack_value_MUX_uxn_opcodes_h_l1699_c7_8a7c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1699_c7_8a7c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1699_c7_8a7c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1699_c7_8a7c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_8a7c
result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_8a7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_8a7c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_8a7c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_8a7c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_8a7c
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_8a7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_8a7c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_8a7c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_8a7c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_8a7c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_8a7c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_8a7c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_8a7c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_8a7c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1699_c7_8a7c
tmp16_MUX_uxn_opcodes_h_l1699_c7_8a7c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1699_c7_8a7c_cond,
tmp16_MUX_uxn_opcodes_h_l1699_c7_8a7c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1699_c7_8a7c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1700_c3_696e
BIN_OP_OR_uxn_opcodes_h_l1700_c3_696e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1700_c3_696e_left,
BIN_OP_OR_uxn_opcodes_h_l1700_c3_696e_right,
BIN_OP_OR_uxn_opcodes_h_l1700_c3_696e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1706_c11_4c50
BIN_OP_EQ_uxn_opcodes_h_l1706_c11_4c50 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1706_c11_4c50_left,
BIN_OP_EQ_uxn_opcodes_h_l1706_c11_4c50_right,
BIN_OP_EQ_uxn_opcodes_h_l1706_c11_4c50_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_70ed
result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_70ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_70ed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_70ed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_70ed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_70ed_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1706_c7_70ed
result_stack_value_MUX_uxn_opcodes_h_l1706_c7_70ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1706_c7_70ed_cond,
result_stack_value_MUX_uxn_opcodes_h_l1706_c7_70ed_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1706_c7_70ed_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1706_c7_70ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_70ed
result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_70ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_70ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_70ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_70ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_70ed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_70ed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_70ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_70ed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_70ed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_70ed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_70ed_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1708_c34_7d20
CONST_SR_8_uxn_opcodes_h_l1708_c34_7d20 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1708_c34_7d20_x,
CONST_SR_8_uxn_opcodes_h_l1708_c34_7d20_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1710_c11_68f8
BIN_OP_EQ_uxn_opcodes_h_l1710_c11_68f8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1710_c11_68f8_left,
BIN_OP_EQ_uxn_opcodes_h_l1710_c11_68f8_right,
BIN_OP_EQ_uxn_opcodes_h_l1710_c11_68f8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_e38b
result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_e38b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_e38b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_e38b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_e38b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_e38b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_e38b
result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_e38b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_e38b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_e38b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_e38b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_e38b_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t8,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1670_c6_cb1d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_ccf6_return_output,
 t8_MUX_uxn_opcodes_h_l1670_c2_6968_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1670_c2_6968_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_6968_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1670_c2_6968_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_6968_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_6968_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_6968_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1670_c2_6968_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_6968_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1670_c2_6968_return_output,
 tmp16_MUX_uxn_opcodes_h_l1670_c2_6968_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1676_c11_cfec_return_output,
 t8_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output,
 tmp16_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1679_c11_fa13_return_output,
 t8_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output,
 tmp16_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1683_c32_ea0b_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1683_c32_f852_return_output,
 MUX_uxn_opcodes_h_l1683_c32_eb85_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1687_c11_27f0_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output,
 tmp16_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1691_c11_3ba1_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_9380_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1691_c7_9380_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1691_c7_9380_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1691_c7_9380_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_9380_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_9380_return_output,
 tmp16_MUX_uxn_opcodes_h_l1691_c7_9380_return_output,
 CONST_SL_8_uxn_opcodes_h_l1693_c3_142a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1694_c32_b34b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5c0f_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_f917_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1696_c7_f917_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1696_c7_f917_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f917_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f917_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f917_return_output,
 tmp16_MUX_uxn_opcodes_h_l1696_c7_f917_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1697_c32_d4fd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1699_c11_855c_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1700_c3_696e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1706_c11_4c50_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_70ed_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1706_c7_70ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_70ed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_70ed_return_output,
 CONST_SR_8_uxn_opcodes_h_l1708_c34_7d20_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1710_c11_68f8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_e38b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_e38b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c6_cb1d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c6_cb1d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c6_cb1d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_ccf6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_ccf6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_ccf6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_ccf6_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1670_c2_6968_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1670_c2_6968_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1670_c2_6968_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1670_c2_6968_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_6968_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_6968_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c2_6968_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c2_6968_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_6968_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_6968_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_6968_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_6968_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1673_c3_4f77 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_6968_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_6968_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1670_c2_6968_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1670_c2_6968_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_6968_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_6968_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1670_c2_6968_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1670_c2_6968_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1670_c2_6968_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1670_c2_6968_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1671_c3_9980_uxn_opcodes_h_l1671_c3_9980_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_cfec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_cfec_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_cfec_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1676_c7_51e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1676_c7_51e5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1676_c7_51e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_51e5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1677_c3_0586 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_51e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1676_c7_51e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_51e5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1676_c7_51e5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1676_c7_51e5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_fa13_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_fa13_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_fa13_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1679_c7_fcba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1679_c7_fcba_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1679_c7_fcba_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_fcba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_fcba_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1679_c7_fcba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_fcba_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_fcba_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1679_c7_fcba_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1683_c32_eb85_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1683_c32_eb85_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1683_c32_eb85_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1683_c32_ea0b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1683_c32_ea0b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1683_c32_ea0b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1683_c32_f852_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1683_c32_f852_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1683_c32_f852_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1683_c32_eb85_return_output : signed(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1685_c21_0208_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1687_c11_27f0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1687_c11_27f0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1687_c11_27f0_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_9380_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1687_c7_1e77_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1691_c7_9380_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1687_c7_1e77_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1687_c7_1e77_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1691_c7_9380_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1687_c7_1e77_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1691_c7_9380_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_1e77_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_9380_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_1e77_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_9380_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1687_c7_1e77_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1691_c7_9380_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1687_c7_1e77_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1689_c21_9b5e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_3ba1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_3ba1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_3ba1_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_f917_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_9380_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1696_c7_f917_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1691_c7_9380_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1696_c7_f917_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1691_c7_9380_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f917_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1691_c7_9380_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f917_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_9380_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f917_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_9380_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_f917_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1691_c7_9380_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1693_c3_142a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1693_c3_142a_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1694_c32_b34b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1694_c32_b34b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1694_c32_b34b_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1694_c21_cd77_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5c0f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5c0f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5c0f_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_f917_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1696_c7_f917_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1696_c7_f917_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f917_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f917_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f917_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_f917_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1697_c32_d4fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1697_c32_d4fd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1697_c32_d4fd_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1697_c21_6a29_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_855c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_855c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_855c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1699_c7_8a7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1699_c7_8a7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1699_c7_8a7c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1699_c7_8a7c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1699_c7_8a7c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1706_c7_70ed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1699_c7_8a7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_8a7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_8a7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_70ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_8a7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_8a7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_8a7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_70ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_8a7c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_8a7c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1703_c3_4103 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_8a7c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_70ed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_8a7c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1699_c7_8a7c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1699_c7_8a7c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1699_c7_8a7c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1700_c3_696e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1700_c3_696e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1700_c3_696e_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1704_c24_ef97_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_4c50_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_4c50_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_4c50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_70ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_70ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_e38b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_70ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1706_c7_70ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1706_c7_70ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1706_c7_70ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_70ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_70ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_e38b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_70ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_70ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1707_c3_b6dc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_70ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_70ed_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1708_c34_7d20_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1708_c34_7d20_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1708_c24_b7ec_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_68f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_68f8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_68f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_e38b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_e38b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_e38b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_e38b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_e38b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_e38b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1676_l1679_l1670_DUPLICATE_b8f7_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1687_l1679_l1676_l1706_l1670_l1696_l1691_DUPLICATE_df76_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1687_l1676_l1670_DUPLICATE_2847_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1687_l1676_l1670_l1699_l1696_l1691_DUPLICATE_8bda_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1687_l1679_l1710_l1676_l1706_l1670_l1696_l1691_DUPLICATE_992c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1676_l1696_l1670_DUPLICATE_6c37_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1676_l1679_DUPLICATE_0ddc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1687_l1679_l1710_l1676_l1706_l1699_l1696_l1691_DUPLICATE_cba5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1687_l1679_l1706_l1696_l1691_DUPLICATE_4a14_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1692_l1700_DUPLICATE_728e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c22c_uxn_opcodes_h_l1715_l1665_DUPLICATE_e58b_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_GT_uxn_opcodes_h_l1683_c32_f852_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_8a7c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_855c_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_cfec_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1694_c32_b34b_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c6_cb1d_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1673_c3_4f77 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1673_c3_4f77;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_e38b_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1683_c32_eb85_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1707_c3_b6dc := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_70ed_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1707_c3_b6dc;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_e38b_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1683_c32_eb85_iffalse := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_AND_uxn_opcodes_h_l1683_c32_ea0b_right := to_unsigned(128, 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_3ba1_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_ccf6_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_4c50_right := to_unsigned(7, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1697_c32_d4fd_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1677_c3_0586 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1677_c3_0586;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1703_c3_4103 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_8a7c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1703_c3_4103;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5c0f_right := to_unsigned(5, 3);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_68f8_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1699_c7_8a7c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_fa13_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1687_c11_27f0_right := to_unsigned(3, 2);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_ccf6_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1683_c32_ea0b_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c6_cb1d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_cfec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_fa13_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1687_c11_27f0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_3ba1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5c0f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_855c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_4c50_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_68f8_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1694_c32_b34b_left := t8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1697_c32_d4fd_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1700_c3_696e_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1708_c34_7d20_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1699_c7_8a7c_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1687_l1676_l1670_l1699_l1696_l1691_DUPLICATE_8bda LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1687_l1676_l1670_l1699_l1696_l1691_DUPLICATE_8bda_return_output := result.is_ram_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1696_c11_5c0f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5c0f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5c0f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5c0f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5c0f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5c0f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5c0f_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1692_l1700_DUPLICATE_728e LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1692_l1700_DUPLICATE_728e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1685_c21_0208] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1685_c21_0208_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_PLUS[uxn_opcodes_h_l1694_c32_b34b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1694_c32_b34b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1694_c32_b34b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1694_c32_b34b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1694_c32_b34b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1694_c32_b34b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1694_c32_b34b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1687_l1679_l1710_l1676_l1706_l1699_l1696_l1691_DUPLICATE_cba5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1687_l1679_l1710_l1676_l1706_l1699_l1696_l1691_DUPLICATE_cba5_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1679_c11_fa13] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1679_c11_fa13_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_fa13_left;
     BIN_OP_EQ_uxn_opcodes_h_l1679_c11_fa13_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_fa13_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_fa13_return_output := BIN_OP_EQ_uxn_opcodes_h_l1679_c11_fa13_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1687_l1676_l1670_DUPLICATE_2847 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1687_l1676_l1670_DUPLICATE_2847_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1706_c11_4c50] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1706_c11_4c50_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_4c50_left;
     BIN_OP_EQ_uxn_opcodes_h_l1706_c11_4c50_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_4c50_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_4c50_return_output := BIN_OP_EQ_uxn_opcodes_h_l1706_c11_4c50_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1676_l1679_l1670_DUPLICATE_b8f7 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1676_l1679_l1670_DUPLICATE_b8f7_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1710_c11_68f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1710_c11_68f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_68f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1710_c11_68f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_68f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_68f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1710_c11_68f8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1676_c11_cfec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1676_c11_cfec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_cfec_left;
     BIN_OP_EQ_uxn_opcodes_h_l1676_c11_cfec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_cfec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_cfec_return_output := BIN_OP_EQ_uxn_opcodes_h_l1676_c11_cfec_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1697_c32_d4fd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1697_c32_d4fd_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1697_c32_d4fd_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1697_c32_d4fd_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1697_c32_d4fd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1697_c32_d4fd_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1697_c32_d4fd_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1676_l1696_l1670_DUPLICATE_6c37 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1676_l1696_l1670_DUPLICATE_6c37_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l1699_c11_855c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1699_c11_855c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_855c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1699_c11_855c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_855c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_855c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1699_c11_855c_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1708_c34_7d20] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1708_c34_7d20_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1708_c34_7d20_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1708_c34_7d20_return_output := CONST_SR_8_uxn_opcodes_h_l1708_c34_7d20_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1687_c11_27f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1687_c11_27f0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1687_c11_27f0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1687_c11_27f0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1687_c11_27f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1687_c11_27f0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1687_c11_27f0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1676_l1679_DUPLICATE_0ddc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1676_l1679_DUPLICATE_0ddc_return_output := result.is_stack_read;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1689_c21_9b5e] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1689_c21_9b5e_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1687_l1679_l1706_l1696_l1691_DUPLICATE_4a14 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1687_l1679_l1706_l1696_l1691_DUPLICATE_4a14_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1691_c11_3ba1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1691_c11_3ba1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_3ba1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1691_c11_3ba1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_3ba1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_3ba1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1691_c11_3ba1_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1683_c32_ea0b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1683_c32_ea0b_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1683_c32_ea0b_left;
     BIN_OP_AND_uxn_opcodes_h_l1683_c32_ea0b_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1683_c32_ea0b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1683_c32_ea0b_return_output := BIN_OP_AND_uxn_opcodes_h_l1683_c32_ea0b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1687_l1679_l1710_l1676_l1706_l1670_l1696_l1691_DUPLICATE_992c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1687_l1679_l1710_l1676_l1706_l1670_l1696_l1691_DUPLICATE_992c_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1687_l1679_l1676_l1706_l1670_l1696_l1691_DUPLICATE_df76 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1687_l1679_l1676_l1706_l1670_l1696_l1691_DUPLICATE_df76_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1670_c6_cb1d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1670_c6_cb1d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c6_cb1d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1670_c6_cb1d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c6_cb1d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c6_cb1d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1670_c6_cb1d_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1683_c32_f852_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1683_c32_ea0b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_ccf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c6_cb1d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_6968_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c6_cb1d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1670_c2_6968_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c6_cb1d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_6968_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c6_cb1d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1670_c2_6968_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c6_cb1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_6968_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c6_cb1d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1670_c2_6968_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c6_cb1d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_6968_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c6_cb1d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_6968_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c6_cb1d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c2_6968_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c6_cb1d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1670_c2_6968_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c6_cb1d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1670_c2_6968_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c6_cb1d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_51e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_cfec_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1676_c7_51e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_cfec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_cfec_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1676_c7_51e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_cfec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_51e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_cfec_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1676_c7_51e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_cfec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_cfec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_51e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_cfec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1676_c7_51e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_cfec_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1676_c7_51e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_cfec_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1676_c7_51e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_cfec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_fcba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_fa13_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1679_c7_fcba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_fa13_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_fa13_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1679_c7_fcba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_fa13_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_fcba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_fa13_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_fcba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_fa13_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_fa13_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_fcba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_fa13_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1679_c7_fcba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_fa13_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1679_c7_fcba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_fa13_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1679_c7_fcba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_fa13_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_1e77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1687_c11_27f0_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1687_c7_1e77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1687_c11_27f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1687_c7_1e77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1687_c11_27f0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_1e77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1687_c11_27f0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1687_c7_1e77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1687_c11_27f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1687_c7_1e77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1687_c11_27f0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1687_c7_1e77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1687_c11_27f0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1687_c7_1e77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1687_c11_27f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_9380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_3ba1_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1691_c7_9380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_3ba1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1691_c7_9380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_3ba1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_9380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_3ba1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_9380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_3ba1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1691_c7_9380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_3ba1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1691_c7_9380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_3ba1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f917_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5c0f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1696_c7_f917_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5c0f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f917_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5c0f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_f917_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5c0f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f917_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5c0f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1696_c7_f917_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5c0f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_f917_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5c0f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_8a7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_855c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1699_c7_8a7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_855c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_8a7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_855c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_8a7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_855c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1699_c7_8a7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_855c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1699_c7_8a7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_855c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_70ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_4c50_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_70ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_4c50_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_70ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_4c50_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1706_c7_70ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1706_c11_4c50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_e38b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_68f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_e38b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_68f8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1685_c21_0208_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1689_c21_9b5e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1700_c3_696e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1692_l1700_DUPLICATE_728e_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1693_c3_142a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1692_l1700_DUPLICATE_728e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1676_l1679_l1670_DUPLICATE_b8f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1676_l1679_l1670_DUPLICATE_b8f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1676_l1679_l1670_DUPLICATE_b8f7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1676_l1696_l1670_DUPLICATE_6c37_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1676_l1696_l1670_DUPLICATE_6c37_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1676_l1696_l1670_DUPLICATE_6c37_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1687_l1679_l1710_l1676_l1706_l1699_l1696_l1691_DUPLICATE_cba5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1687_l1679_l1710_l1676_l1706_l1699_l1696_l1691_DUPLICATE_cba5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1687_l1679_l1710_l1676_l1706_l1699_l1696_l1691_DUPLICATE_cba5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1687_l1679_l1710_l1676_l1706_l1699_l1696_l1691_DUPLICATE_cba5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1687_l1679_l1710_l1676_l1706_l1699_l1696_l1691_DUPLICATE_cba5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_8a7c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1687_l1679_l1710_l1676_l1706_l1699_l1696_l1691_DUPLICATE_cba5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_70ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1687_l1679_l1710_l1676_l1706_l1699_l1696_l1691_DUPLICATE_cba5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_e38b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1687_l1679_l1710_l1676_l1706_l1699_l1696_l1691_DUPLICATE_cba5_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1687_l1676_l1670_l1699_l1696_l1691_DUPLICATE_8bda_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1687_l1676_l1670_l1699_l1696_l1691_DUPLICATE_8bda_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1687_l1676_l1670_l1699_l1696_l1691_DUPLICATE_8bda_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1687_l1676_l1670_l1699_l1696_l1691_DUPLICATE_8bda_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1687_l1676_l1670_l1699_l1696_l1691_DUPLICATE_8bda_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1699_c7_8a7c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1687_l1676_l1670_l1699_l1696_l1691_DUPLICATE_8bda_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1687_l1676_l1670_DUPLICATE_2847_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1687_l1676_l1670_DUPLICATE_2847_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1687_l1676_l1670_DUPLICATE_2847_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1676_l1679_DUPLICATE_0ddc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1676_l1679_DUPLICATE_0ddc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1687_l1679_l1710_l1676_l1706_l1670_l1696_l1691_DUPLICATE_992c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1687_l1679_l1710_l1676_l1706_l1670_l1696_l1691_DUPLICATE_992c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1687_l1679_l1710_l1676_l1706_l1670_l1696_l1691_DUPLICATE_992c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1687_l1679_l1710_l1676_l1706_l1670_l1696_l1691_DUPLICATE_992c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1687_l1679_l1710_l1676_l1706_l1670_l1696_l1691_DUPLICATE_992c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1687_l1679_l1710_l1676_l1706_l1670_l1696_l1691_DUPLICATE_992c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_70ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1687_l1679_l1710_l1676_l1706_l1670_l1696_l1691_DUPLICATE_992c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_e38b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1687_l1679_l1710_l1676_l1706_l1670_l1696_l1691_DUPLICATE_992c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1687_l1679_l1706_l1696_l1691_DUPLICATE_4a14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1687_l1679_l1706_l1696_l1691_DUPLICATE_4a14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1687_l1679_l1706_l1696_l1691_DUPLICATE_4a14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1687_l1679_l1706_l1696_l1691_DUPLICATE_4a14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_70ed_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1687_l1679_l1706_l1696_l1691_DUPLICATE_4a14_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1687_l1679_l1676_l1706_l1670_l1696_l1691_DUPLICATE_df76_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1687_l1679_l1676_l1706_l1670_l1696_l1691_DUPLICATE_df76_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1687_l1679_l1676_l1706_l1670_l1696_l1691_DUPLICATE_df76_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1687_l1679_l1676_l1706_l1670_l1696_l1691_DUPLICATE_df76_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1687_l1679_l1676_l1706_l1670_l1696_l1691_DUPLICATE_df76_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1687_l1679_l1676_l1706_l1670_l1696_l1691_DUPLICATE_df76_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1706_c7_70ed_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1687_l1679_l1676_l1706_l1670_l1696_l1691_DUPLICATE_df76_return_output;
     -- CONST_SL_8[uxn_opcodes_h_l1693_c3_142a] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1693_c3_142a_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1693_c3_142a_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1693_c3_142a_return_output := CONST_SL_8_uxn_opcodes_h_l1693_c3_142a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1706_c7_70ed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_70ed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_70ed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_70ed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_70ed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_70ed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_70ed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_70ed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_70ed_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1683_c32_f852] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1683_c32_f852_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1683_c32_f852_left;
     BIN_OP_GT_uxn_opcodes_h_l1683_c32_f852_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1683_c32_f852_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1683_c32_f852_return_output := BIN_OP_GT_uxn_opcodes_h_l1683_c32_f852_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1694_c21_cd77] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1694_c21_cd77_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1694_c32_b34b_return_output);

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1697_c21_6a29] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1697_c21_6a29_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1697_c32_d4fd_return_output);

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1699_c7_8a7c] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1699_c7_8a7c_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1699_c7_8a7c_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1699_c7_8a7c_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1699_c7_8a7c_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1699_c7_8a7c_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1699_c7_8a7c_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1710_c7_e38b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_e38b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_e38b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_e38b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_e38b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_e38b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_e38b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_e38b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_e38b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1708_c24_b7ec] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1708_c24_b7ec_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1708_c34_7d20_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1710_c7_e38b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_e38b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_e38b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_e38b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_e38b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_e38b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_e38b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_e38b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_e38b_return_output;

     -- t8_MUX[uxn_opcodes_h_l1679_c7_fcba] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1679_c7_fcba_cond <= VAR_t8_MUX_uxn_opcodes_h_l1679_c7_fcba_cond;
     t8_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue;
     t8_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output := t8_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1670_c1_ccf6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_ccf6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_ccf6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_ccf6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_ccf6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_ccf6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_ccf6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_ccf6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_ccf6_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1700_c3_696e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1700_c3_696e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1700_c3_696e_left;
     BIN_OP_OR_uxn_opcodes_h_l1700_c3_696e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1700_c3_696e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1700_c3_696e_return_output := BIN_OP_OR_uxn_opcodes_h_l1700_c3_696e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1687_c7_1e77] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1687_c7_1e77_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1687_c7_1e77_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1679_c7_fcba] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1679_c7_fcba_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1679_c7_fcba_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1683_c32_eb85_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1683_c32_f852_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1699_c7_8a7c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1700_c3_696e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1694_c21_cd77_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1697_c21_6a29_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1706_c7_70ed_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1708_c24_b7ec_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1693_c3_142a_return_output;
     VAR_printf_uxn_opcodes_h_l1671_c3_9980_uxn_opcodes_h_l1671_c3_9980_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1670_c1_ccf6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_70ed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_e38b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_70ed_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_e38b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_8a7c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1706_c7_70ed_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output;
     -- printf_uxn_opcodes_h_l1671_c3_9980[uxn_opcodes_h_l1671_c3_9980] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1671_c3_9980_uxn_opcodes_h_l1671_c3_9980_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1671_c3_9980_uxn_opcodes_h_l1671_c3_9980_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1696_c7_f917] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1696_c7_f917_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1696_c7_f917_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1696_c7_f917_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1696_c7_f917_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1706_c7_70ed] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1706_c7_70ed_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1706_c7_70ed_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1706_c7_70ed_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1706_c7_70ed_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1706_c7_70ed_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1706_c7_70ed_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1706_c7_70ed_return_output := result_stack_value_MUX_uxn_opcodes_h_l1706_c7_70ed_return_output;

     -- MUX[uxn_opcodes_h_l1683_c32_eb85] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1683_c32_eb85_cond <= VAR_MUX_uxn_opcodes_h_l1683_c32_eb85_cond;
     MUX_uxn_opcodes_h_l1683_c32_eb85_iftrue <= VAR_MUX_uxn_opcodes_h_l1683_c32_eb85_iftrue;
     MUX_uxn_opcodes_h_l1683_c32_eb85_iffalse <= VAR_MUX_uxn_opcodes_h_l1683_c32_eb85_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1683_c32_eb85_return_output := MUX_uxn_opcodes_h_l1683_c32_eb85_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1696_c7_f917] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_f917_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_f917_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_f917_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_f917_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1699_c7_8a7c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1699_c7_8a7c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1699_c7_8a7c_cond;
     tmp16_MUX_uxn_opcodes_h_l1699_c7_8a7c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1699_c7_8a7c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1699_c7_8a7c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1699_c7_8a7c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output := tmp16_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output;

     -- t8_MUX[uxn_opcodes_h_l1676_c7_51e5] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1676_c7_51e5_cond <= VAR_t8_MUX_uxn_opcodes_h_l1676_c7_51e5_cond;
     t8_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue;
     t8_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output := t8_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1706_c7_70ed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_70ed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_70ed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_70ed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_70ed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_70ed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_70ed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_70ed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_70ed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1706_c7_70ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_70ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_70ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_70ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_70ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_70ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_70ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_70ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_70ed_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1679_c7_fcba] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1699_c7_8a7c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_8a7c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_8a7c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_8a7c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_8a7c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_8a7c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_8a7c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1704_c24_ef97] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1704_c24_ef97_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1700_c3_696e_return_output);

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1676_c7_51e5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1676_c7_51e5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1676_c7_51e5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output;

     -- Submodule level 3
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1699_c7_8a7c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1704_c24_ef97_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue := VAR_MUX_uxn_opcodes_h_l1683_c32_eb85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_8a7c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1706_c7_70ed_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1696_c7_f917_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_8a7c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1706_c7_70ed_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_f917_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1699_c7_8a7c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1706_c7_70ed_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1696_c7_f917] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f917_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f917_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f917_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f917_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1679_c7_fcba] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1696_c7_f917] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1696_c7_f917_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_f917_cond;
     tmp16_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_f917_return_output := tmp16_MUX_uxn_opcodes_h_l1696_c7_f917_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1691_c7_9380] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1691_c7_9380_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1691_c7_9380_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1691_c7_9380_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1691_c7_9380_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1699_c7_8a7c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_8a7c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_8a7c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_8a7c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_8a7c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_8a7c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_8a7c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1670_c2_6968] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1670_c2_6968_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1670_c2_6968_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1670_c2_6968_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1670_c2_6968_return_output;

     -- t8_MUX[uxn_opcodes_h_l1670_c2_6968] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1670_c2_6968_cond <= VAR_t8_MUX_uxn_opcodes_h_l1670_c2_6968_cond;
     t8_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue;
     t8_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1670_c2_6968_return_output := t8_MUX_uxn_opcodes_h_l1670_c2_6968_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1699_c7_8a7c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_8a7c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_8a7c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_8a7c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_8a7c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_8a7c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_8a7c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1691_c7_9380] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_9380_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_9380_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_9380_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_9380_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1676_c7_51e5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1699_c7_8a7c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1699_c7_8a7c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1699_c7_8a7c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1699_c7_8a7c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1699_c7_8a7c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1699_c7_8a7c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1699_c7_8a7c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1691_c7_9380_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_9380_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_f917_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1699_c7_8a7c_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1670_c2_6968_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_f917_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1696_c7_f917] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f917_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f917_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f917_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f917_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1687_c7_1e77] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1687_c7_1e77_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1687_c7_1e77_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1687_c7_1e77] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1687_c7_1e77_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1687_c7_1e77_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1691_c7_9380] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1691_c7_9380_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1691_c7_9380_cond;
     tmp16_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1691_c7_9380_return_output := tmp16_MUX_uxn_opcodes_h_l1691_c7_9380_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1696_c7_f917] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f917_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f917_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f917_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f917_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1696_c7_f917] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1696_c7_f917_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1696_c7_f917_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1696_c7_f917_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1696_c7_f917_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1696_c7_f917_return_output := result_stack_value_MUX_uxn_opcodes_h_l1696_c7_f917_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1670_c2_6968] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_6968_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_6968_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_6968_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_6968_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1691_c7_9380] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_9380_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_9380_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_9380_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_9380_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1676_c7_51e5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_f917_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_f917_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_9380_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1696_c7_f917_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1691_c7_9380_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1687_c7_1e77] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1687_c7_1e77_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1687_c7_1e77_cond;
     tmp16_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output := tmp16_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1679_c7_fcba] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1679_c7_fcba_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1679_c7_fcba_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1691_c7_9380] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1691_c7_9380_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1691_c7_9380_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1691_c7_9380_return_output := result_stack_value_MUX_uxn_opcodes_h_l1691_c7_9380_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1691_c7_9380] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1691_c7_9380_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1691_c7_9380_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1691_c7_9380_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1691_c7_9380_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1679_c7_fcba] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_fcba_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_fcba_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1670_c2_6968] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_6968_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_6968_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_6968_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_6968_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1687_c7_1e77] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1687_c7_1e77_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1687_c7_1e77_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1691_c7_9380] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_9380_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_9380_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_9380_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_9380_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_9380_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_9380_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_9380_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1691_c7_9380_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1691_c7_9380_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1679_c7_fcba] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_fcba_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_fcba_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1676_c7_51e5] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1676_c7_51e5_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1676_c7_51e5_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1687_c7_1e77] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_1e77_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_1e77_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1676_c7_51e5] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1676_c7_51e5_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1676_c7_51e5_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1687_c7_1e77] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1687_c7_1e77_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1687_c7_1e77_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output := result_stack_value_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1687_c7_1e77] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_1e77_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_1e77_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_1e77_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_1e77_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1679_c7_fcba] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1679_c7_fcba_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1679_c7_fcba_cond;
     tmp16_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output := tmp16_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1687_c7_1e77_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1670_c2_6968] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1670_c2_6968_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1670_c2_6968_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1670_c2_6968_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1670_c2_6968_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1679_c7_fcba] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1679_c7_fcba_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1679_c7_fcba_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output := result_stack_value_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1670_c2_6968] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1670_c2_6968_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1670_c2_6968_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1670_c2_6968_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1670_c2_6968_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1676_c7_51e5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_51e5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_51e5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1679_c7_fcba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_fcba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_fcba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1679_c7_fcba] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_fcba_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_fcba_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_fcba_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_fcba_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1676_c7_51e5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1676_c7_51e5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1676_c7_51e5_cond;
     tmp16_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output := tmp16_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1679_c7_fcba_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1670_c2_6968] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1670_c2_6968_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1670_c2_6968_cond;
     tmp16_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1670_c2_6968_return_output := tmp16_MUX_uxn_opcodes_h_l1670_c2_6968_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1670_c2_6968] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_6968_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_6968_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_6968_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_6968_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1676_c7_51e5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_51e5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_51e5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1676_c7_51e5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_51e5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_51e5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1676_c7_51e5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1676_c7_51e5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1676_c7_51e5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1676_c7_51e5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1676_c7_51e5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output := result_stack_value_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1676_c7_51e5_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1670_c2_6968_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1670_c2_6968] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_6968_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_6968_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_6968_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_6968_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1670_c2_6968] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1670_c2_6968_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c2_6968_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c2_6968_return_output := result_stack_value_MUX_uxn_opcodes_h_l1670_c2_6968_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1670_c2_6968] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_6968_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_6968_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_6968_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_6968_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_6968_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_6968_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c22c_uxn_opcodes_h_l1715_l1665_DUPLICATE_e58b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c22c_uxn_opcodes_h_l1715_l1665_DUPLICATE_e58b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c22c(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1670_c2_6968_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c2_6968_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c2_6968_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c2_6968_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c2_6968_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c2_6968_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1670_c2_6968_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c2_6968_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1670_c2_6968_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c22c_uxn_opcodes_h_l1715_l1665_DUPLICATE_e58b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c22c_uxn_opcodes_h_l1715_l1665_DUPLICATE_e58b_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
