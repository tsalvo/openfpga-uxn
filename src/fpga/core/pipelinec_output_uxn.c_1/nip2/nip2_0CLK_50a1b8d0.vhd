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
-- Submodules: 71
entity nip2_0CLK_50a1b8d0 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end nip2_0CLK_50a1b8d0;
architecture arch of nip2_0CLK_50a1b8d0 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1438_c6_5fbe]
signal BIN_OP_EQ_uxn_opcodes_h_l1438_c6_5fbe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1438_c6_5fbe_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1438_c6_5fbe_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1438_c1_d0fc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1438_c1_d0fc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1438_c1_d0fc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1438_c1_d0fc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1438_c1_d0fc_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1438_c2_3085]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1438_c2_3085_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1438_c2_3085_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1438_c2_3085]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1438_c2_3085_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1438_c2_3085_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1438_c2_3085]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1438_c2_3085_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1438_c2_3085_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1438_c2_3085]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1438_c2_3085_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1438_c2_3085_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1438_c2_3085]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1438_c2_3085_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1438_c2_3085_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1438_c2_3085]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1438_c2_3085_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1438_c2_3085_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1438_c2_3085]
signal result_stack_value_MUX_uxn_opcodes_h_l1438_c2_3085_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1438_c2_3085_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1438_c2_3085]
signal t16_MUX_uxn_opcodes_h_l1438_c2_3085_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1438_c2_3085_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1439_c3_6291[uxn_opcodes_h_l1439_c3_6291]
signal printf_uxn_opcodes_h_l1439_c3_6291_uxn_opcodes_h_l1439_c3_6291_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1444_c11_aace]
signal BIN_OP_EQ_uxn_opcodes_h_l1444_c11_aace_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1444_c11_aace_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1444_c11_aace_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1444_c7_d517]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_d517_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_d517_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1444_c7_d517]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_d517_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_d517_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1444_c7_d517]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_d517_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_d517_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1444_c7_d517]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_d517_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_d517_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1444_c7_d517]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_d517_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_d517_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1444_c7_d517]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_d517_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_d517_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1444_c7_d517]
signal result_stack_value_MUX_uxn_opcodes_h_l1444_c7_d517_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1444_c7_d517_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1444_c7_d517]
signal t16_MUX_uxn_opcodes_h_l1444_c7_d517_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1444_c7_d517_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1447_c11_98a9]
signal BIN_OP_EQ_uxn_opcodes_h_l1447_c11_98a9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1447_c11_98a9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1447_c11_98a9_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1447_c7_2236]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_2236_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_2236_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1447_c7_2236]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_2236_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_2236_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1447_c7_2236]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_2236_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_2236_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1447_c7_2236]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_2236_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_2236_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1447_c7_2236]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_2236_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_2236_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1447_c7_2236]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_2236_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_2236_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1447_c7_2236]
signal result_stack_value_MUX_uxn_opcodes_h_l1447_c7_2236_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1447_c7_2236_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1447_c7_2236]
signal t16_MUX_uxn_opcodes_h_l1447_c7_2236_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1447_c7_2236_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1449_c3_43cc]
signal CONST_SL_8_uxn_opcodes_h_l1449_c3_43cc_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1449_c3_43cc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1452_c11_9d7d]
signal BIN_OP_EQ_uxn_opcodes_h_l1452_c11_9d7d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1452_c11_9d7d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1452_c11_9d7d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1452_c7_ae7d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1452_c7_ae7d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1452_c7_ae7d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1452_c7_ae7d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1452_c7_ae7d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1452_c7_ae7d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1452_c7_ae7d]
signal result_stack_value_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1452_c7_ae7d]
signal t16_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1455_c11_3037]
signal BIN_OP_EQ_uxn_opcodes_h_l1455_c11_3037_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1455_c11_3037_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1455_c11_3037_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1455_c7_8ac5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1455_c7_8ac5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1455_c7_8ac5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1455_c7_8ac5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1455_c7_8ac5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1455_c7_8ac5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1455_c7_8ac5]
signal result_stack_value_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1455_c7_8ac5]
signal t16_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1456_c3_acc2]
signal BIN_OP_OR_uxn_opcodes_h_l1456_c3_acc2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1456_c3_acc2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1456_c3_acc2_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1459_c32_03f2]
signal BIN_OP_AND_uxn_opcodes_h_l1459_c32_03f2_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1459_c32_03f2_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1459_c32_03f2_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1459_c32_3777]
signal BIN_OP_GT_uxn_opcodes_h_l1459_c32_3777_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1459_c32_3777_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1459_c32_3777_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1459_c32_1421]
signal MUX_uxn_opcodes_h_l1459_c32_1421_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1459_c32_1421_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1459_c32_1421_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1459_c32_1421_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1461_c11_a9ac]
signal BIN_OP_EQ_uxn_opcodes_h_l1461_c11_a9ac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1461_c11_a9ac_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1461_c11_a9ac_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1461_c7_ab13]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_ab13_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_ab13_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_ab13_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_ab13_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1461_c7_ab13]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_ab13_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_ab13_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_ab13_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_ab13_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1461_c7_ab13]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_ab13_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_ab13_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_ab13_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_ab13_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1461_c7_ab13]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_ab13_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_ab13_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_ab13_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_ab13_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1461_c7_ab13]
signal result_stack_value_MUX_uxn_opcodes_h_l1461_c7_ab13_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1461_c7_ab13_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1461_c7_ab13_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1461_c7_ab13_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1467_c11_1af9]
signal BIN_OP_EQ_uxn_opcodes_h_l1467_c11_1af9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1467_c11_1af9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1467_c11_1af9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1467_c7_ef7b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_ef7b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_ef7b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_ef7b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_ef7b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1467_c7_ef7b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_ef7b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_ef7b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_ef7b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_ef7b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1467_c7_ef7b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_ef7b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_ef7b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_ef7b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_ef7b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1467_c7_ef7b]
signal result_stack_value_MUX_uxn_opcodes_h_l1467_c7_ef7b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1467_c7_ef7b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1467_c7_ef7b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1467_c7_ef7b_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1469_c34_bf5e]
signal CONST_SR_8_uxn_opcodes_h_l1469_c34_bf5e_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1469_c34_bf5e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1471_c11_1316]
signal BIN_OP_EQ_uxn_opcodes_h_l1471_c11_1316_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1471_c11_1316_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1471_c11_1316_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1471_c7_1e32]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1e32_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1e32_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1e32_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1e32_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1471_c7_1e32]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1e32_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1e32_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1e32_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1e32_return_output : unsigned(0 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_28d7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1438_c6_5fbe
BIN_OP_EQ_uxn_opcodes_h_l1438_c6_5fbe : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1438_c6_5fbe_left,
BIN_OP_EQ_uxn_opcodes_h_l1438_c6_5fbe_right,
BIN_OP_EQ_uxn_opcodes_h_l1438_c6_5fbe_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1438_c1_d0fc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1438_c1_d0fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1438_c1_d0fc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1438_c1_d0fc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1438_c1_d0fc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1438_c1_d0fc_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1438_c2_3085
result_is_stack_read_MUX_uxn_opcodes_h_l1438_c2_3085 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1438_c2_3085_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1438_c2_3085_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1438_c2_3085
result_sp_relative_shift_MUX_uxn_opcodes_h_l1438_c2_3085 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1438_c2_3085_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1438_c2_3085_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1438_c2_3085
result_is_opc_done_MUX_uxn_opcodes_h_l1438_c2_3085 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1438_c2_3085_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1438_c2_3085_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1438_c2_3085
result_is_stack_write_MUX_uxn_opcodes_h_l1438_c2_3085 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1438_c2_3085_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1438_c2_3085_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1438_c2_3085
result_is_sp_shift_MUX_uxn_opcodes_h_l1438_c2_3085 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1438_c2_3085_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1438_c2_3085_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1438_c2_3085
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1438_c2_3085 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1438_c2_3085_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1438_c2_3085_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1438_c2_3085
result_stack_value_MUX_uxn_opcodes_h_l1438_c2_3085 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1438_c2_3085_cond,
result_stack_value_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1438_c2_3085_return_output);

-- t16_MUX_uxn_opcodes_h_l1438_c2_3085
t16_MUX_uxn_opcodes_h_l1438_c2_3085 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1438_c2_3085_cond,
t16_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue,
t16_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse,
t16_MUX_uxn_opcodes_h_l1438_c2_3085_return_output);

-- printf_uxn_opcodes_h_l1439_c3_6291_uxn_opcodes_h_l1439_c3_6291
printf_uxn_opcodes_h_l1439_c3_6291_uxn_opcodes_h_l1439_c3_6291 : entity work.printf_uxn_opcodes_h_l1439_c3_6291_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1439_c3_6291_uxn_opcodes_h_l1439_c3_6291_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1444_c11_aace
BIN_OP_EQ_uxn_opcodes_h_l1444_c11_aace : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1444_c11_aace_left,
BIN_OP_EQ_uxn_opcodes_h_l1444_c11_aace_right,
BIN_OP_EQ_uxn_opcodes_h_l1444_c11_aace_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_d517
result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_d517 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_d517_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_d517_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_d517
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_d517 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_d517_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_d517_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_d517
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_d517 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_d517_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_d517_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_d517
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_d517 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_d517_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_d517_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_d517
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_d517 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_d517_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_d517_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_d517
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_d517 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_d517_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_d517_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1444_c7_d517
result_stack_value_MUX_uxn_opcodes_h_l1444_c7_d517 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1444_c7_d517_cond,
result_stack_value_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1444_c7_d517_return_output);

-- t16_MUX_uxn_opcodes_h_l1444_c7_d517
t16_MUX_uxn_opcodes_h_l1444_c7_d517 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1444_c7_d517_cond,
t16_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue,
t16_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse,
t16_MUX_uxn_opcodes_h_l1444_c7_d517_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1447_c11_98a9
BIN_OP_EQ_uxn_opcodes_h_l1447_c11_98a9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1447_c11_98a9_left,
BIN_OP_EQ_uxn_opcodes_h_l1447_c11_98a9_right,
BIN_OP_EQ_uxn_opcodes_h_l1447_c11_98a9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_2236
result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_2236 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_2236_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_2236_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_2236
result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_2236 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_2236_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_2236_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_2236
result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_2236 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_2236_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_2236_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_2236
result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_2236 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_2236_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_2236_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_2236
result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_2236 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_2236_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_2236_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_2236
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_2236 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_2236_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_2236_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1447_c7_2236
result_stack_value_MUX_uxn_opcodes_h_l1447_c7_2236 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1447_c7_2236_cond,
result_stack_value_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1447_c7_2236_return_output);

-- t16_MUX_uxn_opcodes_h_l1447_c7_2236
t16_MUX_uxn_opcodes_h_l1447_c7_2236 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1447_c7_2236_cond,
t16_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue,
t16_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse,
t16_MUX_uxn_opcodes_h_l1447_c7_2236_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1449_c3_43cc
CONST_SL_8_uxn_opcodes_h_l1449_c3_43cc : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1449_c3_43cc_x,
CONST_SL_8_uxn_opcodes_h_l1449_c3_43cc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1452_c11_9d7d
BIN_OP_EQ_uxn_opcodes_h_l1452_c11_9d7d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1452_c11_9d7d_left,
BIN_OP_EQ_uxn_opcodes_h_l1452_c11_9d7d_right,
BIN_OP_EQ_uxn_opcodes_h_l1452_c11_9d7d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1452_c7_ae7d
result_is_stack_read_MUX_uxn_opcodes_h_l1452_c7_ae7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_ae7d
result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_ae7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_ae7d
result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_ae7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d
result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_ae7d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_ae7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1452_c7_ae7d
result_stack_value_MUX_uxn_opcodes_h_l1452_c7_ae7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output);

-- t16_MUX_uxn_opcodes_h_l1452_c7_ae7d
t16_MUX_uxn_opcodes_h_l1452_c7_ae7d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond,
t16_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue,
t16_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse,
t16_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1455_c11_3037
BIN_OP_EQ_uxn_opcodes_h_l1455_c11_3037 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1455_c11_3037_left,
BIN_OP_EQ_uxn_opcodes_h_l1455_c11_3037_right,
BIN_OP_EQ_uxn_opcodes_h_l1455_c11_3037_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1455_c7_8ac5
result_is_stack_read_MUX_uxn_opcodes_h_l1455_c7_8ac5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1455_c7_8ac5
result_is_opc_done_MUX_uxn_opcodes_h_l1455_c7_8ac5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1455_c7_8ac5
result_is_stack_write_MUX_uxn_opcodes_h_l1455_c7_8ac5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5
result_is_sp_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1455_c7_8ac5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1455_c7_8ac5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1455_c7_8ac5
result_stack_value_MUX_uxn_opcodes_h_l1455_c7_8ac5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond,
result_stack_value_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output);

-- t16_MUX_uxn_opcodes_h_l1455_c7_8ac5
t16_MUX_uxn_opcodes_h_l1455_c7_8ac5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond,
t16_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue,
t16_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse,
t16_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1456_c3_acc2
BIN_OP_OR_uxn_opcodes_h_l1456_c3_acc2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1456_c3_acc2_left,
BIN_OP_OR_uxn_opcodes_h_l1456_c3_acc2_right,
BIN_OP_OR_uxn_opcodes_h_l1456_c3_acc2_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1459_c32_03f2
BIN_OP_AND_uxn_opcodes_h_l1459_c32_03f2 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1459_c32_03f2_left,
BIN_OP_AND_uxn_opcodes_h_l1459_c32_03f2_right,
BIN_OP_AND_uxn_opcodes_h_l1459_c32_03f2_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1459_c32_3777
BIN_OP_GT_uxn_opcodes_h_l1459_c32_3777 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1459_c32_3777_left,
BIN_OP_GT_uxn_opcodes_h_l1459_c32_3777_right,
BIN_OP_GT_uxn_opcodes_h_l1459_c32_3777_return_output);

-- MUX_uxn_opcodes_h_l1459_c32_1421
MUX_uxn_opcodes_h_l1459_c32_1421 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1459_c32_1421_cond,
MUX_uxn_opcodes_h_l1459_c32_1421_iftrue,
MUX_uxn_opcodes_h_l1459_c32_1421_iffalse,
MUX_uxn_opcodes_h_l1459_c32_1421_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1461_c11_a9ac
BIN_OP_EQ_uxn_opcodes_h_l1461_c11_a9ac : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1461_c11_a9ac_left,
BIN_OP_EQ_uxn_opcodes_h_l1461_c11_a9ac_right,
BIN_OP_EQ_uxn_opcodes_h_l1461_c11_a9ac_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_ab13
result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_ab13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_ab13_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_ab13_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_ab13_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_ab13_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_ab13
result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_ab13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_ab13_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_ab13_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_ab13_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_ab13_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_ab13
result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_ab13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_ab13_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_ab13_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_ab13_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_ab13_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_ab13
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_ab13 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_ab13_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_ab13_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_ab13_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_ab13_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1461_c7_ab13
result_stack_value_MUX_uxn_opcodes_h_l1461_c7_ab13 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1461_c7_ab13_cond,
result_stack_value_MUX_uxn_opcodes_h_l1461_c7_ab13_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1461_c7_ab13_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1461_c7_ab13_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1467_c11_1af9
BIN_OP_EQ_uxn_opcodes_h_l1467_c11_1af9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1467_c11_1af9_left,
BIN_OP_EQ_uxn_opcodes_h_l1467_c11_1af9_right,
BIN_OP_EQ_uxn_opcodes_h_l1467_c11_1af9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_ef7b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_ef7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_ef7b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_ef7b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_ef7b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_ef7b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_ef7b
result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_ef7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_ef7b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_ef7b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_ef7b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_ef7b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_ef7b
result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_ef7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_ef7b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_ef7b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_ef7b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_ef7b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1467_c7_ef7b
result_stack_value_MUX_uxn_opcodes_h_l1467_c7_ef7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1467_c7_ef7b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1467_c7_ef7b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1467_c7_ef7b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1467_c7_ef7b_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1469_c34_bf5e
CONST_SR_8_uxn_opcodes_h_l1469_c34_bf5e : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1469_c34_bf5e_x,
CONST_SR_8_uxn_opcodes_h_l1469_c34_bf5e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1471_c11_1316
BIN_OP_EQ_uxn_opcodes_h_l1471_c11_1316 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1471_c11_1316_left,
BIN_OP_EQ_uxn_opcodes_h_l1471_c11_1316_right,
BIN_OP_EQ_uxn_opcodes_h_l1471_c11_1316_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1e32
result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1e32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1e32_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1e32_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1e32_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1e32_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1e32
result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1e32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1e32_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1e32_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1e32_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1e32_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1438_c6_5fbe_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1438_c1_d0fc_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1438_c2_3085_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1438_c2_3085_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1438_c2_3085_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1438_c2_3085_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1438_c2_3085_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1438_c2_3085_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1438_c2_3085_return_output,
 t16_MUX_uxn_opcodes_h_l1438_c2_3085_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1444_c11_aace_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_d517_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_d517_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_d517_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_d517_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_d517_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_d517_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1444_c7_d517_return_output,
 t16_MUX_uxn_opcodes_h_l1444_c7_d517_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1447_c11_98a9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_2236_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_2236_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_2236_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_2236_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_2236_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_2236_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1447_c7_2236_return_output,
 t16_MUX_uxn_opcodes_h_l1447_c7_2236_return_output,
 CONST_SL_8_uxn_opcodes_h_l1449_c3_43cc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1452_c11_9d7d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output,
 t16_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1455_c11_3037_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output,
 t16_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1456_c3_acc2_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1459_c32_03f2_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1459_c32_3777_return_output,
 MUX_uxn_opcodes_h_l1459_c32_1421_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1461_c11_a9ac_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_ab13_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_ab13_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_ab13_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_ab13_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1461_c7_ab13_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1467_c11_1af9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_ef7b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_ef7b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_ef7b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1467_c7_ef7b_return_output,
 CONST_SR_8_uxn_opcodes_h_l1469_c34_bf5e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1471_c11_1316_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1e32_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1e32_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1438_c6_5fbe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1438_c6_5fbe_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1438_c6_5fbe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1438_c1_d0fc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1438_c1_d0fc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1438_c1_d0fc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1438_c1_d0fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_d517_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1438_c2_3085_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1438_c2_3085_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_d517_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1438_c2_3085_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1438_c2_3085_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_d517_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1438_c2_3085_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1438_c2_3085_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_d517_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1438_c2_3085_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1438_c2_3085_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_d517_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1438_c2_3085_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1438_c2_3085_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1441_c3_5f4f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_d517_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1438_c2_3085_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1438_c2_3085_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_d517_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1438_c2_3085_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1438_c2_3085_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1444_c7_d517_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1438_c2_3085_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1438_c2_3085_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1439_c3_6291_uxn_opcodes_h_l1439_c3_6291_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_aace_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_aace_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_aace_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_2236_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_d517_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_2236_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_d517_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_2236_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_d517_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_2236_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_d517_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_2236_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_d517_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1445_c3_b34c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_2236_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_d517_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1447_c7_2236_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_d517_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1447_c7_2236_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1444_c7_d517_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_98a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_98a9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_98a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_2236_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_2236_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_2236_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_2236_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_2236_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1450_c3_9e98 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_2236_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1447_c7_2236_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1447_c7_2236_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1449_c3_43cc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1449_c3_43cc_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1452_c11_9d7d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1452_c11_9d7d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1452_c11_9d7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1453_c3_c566 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1455_c11_3037_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1455_c11_3037_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1455_c11_3037_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_ab13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_ab13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_ab13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_ab13_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1461_c7_ab13_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1456_c3_acc2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1456_c3_acc2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1456_c3_acc2_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1459_c32_1421_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1459_c32_1421_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1459_c32_1421_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1459_c32_03f2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1459_c32_03f2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1459_c32_03f2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1459_c32_3777_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1459_c32_3777_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1459_c32_3777_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1459_c32_1421_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_a9ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_a9ac_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_a9ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_ab13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_ab13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_ef7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_ab13_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_ab13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_ab13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_ef7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_ab13_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_ab13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_ab13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_ab13_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_ab13_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1464_c3_46e4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_ab13_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_ef7b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_ab13_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1461_c7_ab13_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1461_c7_ab13_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_ef7b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1461_c7_ab13_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1465_c24_b75e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_1af9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_1af9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_1af9_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_ef7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1468_c3_dac9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_ef7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_ef7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_ef7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_ef7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1e32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_ef7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_ef7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_ef7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1e32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_ef7b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_ef7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_ef7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_ef7b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1469_c34_bf5e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1469_c34_bf5e_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1469_c24_41ba_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_1316_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_1316_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_1316_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1e32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1e32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1e32_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1e32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1e32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1e32_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1455_l1447_l1452_l1438_l1444_DUPLICATE_d17f_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1455_l1447_l1452_l1438_l1471_l1444_l1467_DUPLICATE_c444_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1447_l1452_l1438_l1444_l1461_DUPLICATE_e550_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1455_l1447_l1452_l1438_l1444_l1467_DUPLICATE_0094_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1444_l1447_l1455_l1452_DUPLICATE_9e94_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1455_l1447_l1452_l1471_l1444_l1461_l1467_DUPLICATE_0e64_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1456_l1448_DUPLICATE_8d32_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1455_l1467_DUPLICATE_8359_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1476_l1434_DUPLICATE_9b8c_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1468_c3_dac9 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_ef7b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1468_c3_dac9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_1316_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1452_c11_9d7d_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l1459_c32_1421_iffalse := resize(to_signed(-2, 3), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1438_c1_d0fc_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1438_c6_5fbe_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1455_c11_3037_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1e32_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1453_c3_c566 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1453_c3_c566;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_98a9_right := to_unsigned(2, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_ab13_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1450_c3_9e98 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1450_c3_9e98;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1459_c32_3777_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_a9ac_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l1459_c32_1421_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1441_c3_5f4f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1441_c3_5f4f;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1e32_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1445_c3_b34c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1445_c3_b34c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_1af9_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1464_c3_46e4 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_ab13_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1464_c3_46e4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_aace_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_ab13_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1459_c32_03f2_right := to_unsigned(128, 8);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1438_c1_d0fc_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1459_c32_03f2_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1438_c6_5fbe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_aace_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_98a9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1452_c11_9d7d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1455_c11_3037_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_a9ac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_1af9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_1316_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1456_c3_acc2_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1469_c34_bf5e_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse := t16;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1465_c24_b75e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1465_c24_b75e_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1455_l1447_l1452_l1471_l1444_l1461_l1467_DUPLICATE_0e64 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1455_l1447_l1452_l1471_l1444_l1461_l1467_DUPLICATE_0e64_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1461_c11_a9ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1461_c11_a9ac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_a9ac_left;
     BIN_OP_EQ_uxn_opcodes_h_l1461_c11_a9ac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_a9ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_a9ac_return_output := BIN_OP_EQ_uxn_opcodes_h_l1461_c11_a9ac_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1469_c34_bf5e] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1469_c34_bf5e_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1469_c34_bf5e_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1469_c34_bf5e_return_output := CONST_SR_8_uxn_opcodes_h_l1469_c34_bf5e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1452_c11_9d7d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1452_c11_9d7d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1452_c11_9d7d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1452_c11_9d7d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1452_c11_9d7d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1452_c11_9d7d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1452_c11_9d7d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1455_c11_3037] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1455_c11_3037_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1455_c11_3037_left;
     BIN_OP_EQ_uxn_opcodes_h_l1455_c11_3037_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1455_c11_3037_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1455_c11_3037_return_output := BIN_OP_EQ_uxn_opcodes_h_l1455_c11_3037_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1459_c32_03f2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1459_c32_03f2_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1459_c32_03f2_left;
     BIN_OP_AND_uxn_opcodes_h_l1459_c32_03f2_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1459_c32_03f2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1459_c32_03f2_return_output := BIN_OP_AND_uxn_opcodes_h_l1459_c32_03f2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1444_l1447_l1455_l1452_DUPLICATE_9e94 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1444_l1447_l1455_l1452_DUPLICATE_9e94_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1455_l1447_l1452_l1438_l1444_l1467_DUPLICATE_0094 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1455_l1447_l1452_l1438_l1444_l1467_DUPLICATE_0094_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1438_c6_5fbe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1438_c6_5fbe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1438_c6_5fbe_left;
     BIN_OP_EQ_uxn_opcodes_h_l1438_c6_5fbe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1438_c6_5fbe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1438_c6_5fbe_return_output := BIN_OP_EQ_uxn_opcodes_h_l1438_c6_5fbe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1467_c11_1af9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1467_c11_1af9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_1af9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1467_c11_1af9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_1af9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_1af9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1467_c11_1af9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1455_l1447_l1452_l1438_l1471_l1444_l1467_DUPLICATE_c444 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1455_l1447_l1452_l1438_l1471_l1444_l1467_DUPLICATE_c444_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1444_c11_aace] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1444_c11_aace_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_aace_left;
     BIN_OP_EQ_uxn_opcodes_h_l1444_c11_aace_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_aace_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_aace_return_output := BIN_OP_EQ_uxn_opcodes_h_l1444_c11_aace_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1456_l1448_DUPLICATE_8d32 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1456_l1448_DUPLICATE_8d32_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1447_c11_98a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1447_c11_98a9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_98a9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1447_c11_98a9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_98a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_98a9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1447_c11_98a9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1471_c11_1316] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1471_c11_1316_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_1316_left;
     BIN_OP_EQ_uxn_opcodes_h_l1471_c11_1316_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_1316_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_1316_return_output := BIN_OP_EQ_uxn_opcodes_h_l1471_c11_1316_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1455_l1467_DUPLICATE_8359 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1455_l1467_DUPLICATE_8359_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1447_l1452_l1438_l1444_l1461_DUPLICATE_e550 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1447_l1452_l1438_l1444_l1461_DUPLICATE_e550_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1455_l1447_l1452_l1438_l1444_DUPLICATE_d17f LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1455_l1447_l1452_l1438_l1444_DUPLICATE_d17f_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1459_c32_3777_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1459_c32_03f2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1438_c1_d0fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1438_c6_5fbe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1438_c2_3085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1438_c6_5fbe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1438_c2_3085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1438_c6_5fbe_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1438_c2_3085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1438_c6_5fbe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1438_c2_3085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1438_c6_5fbe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1438_c2_3085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1438_c6_5fbe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1438_c2_3085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1438_c6_5fbe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1438_c2_3085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1438_c6_5fbe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1438_c2_3085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1438_c6_5fbe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_d517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_aace_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_d517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_aace_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_d517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_aace_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_d517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_aace_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_d517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_aace_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_d517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_aace_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_d517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_aace_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1444_c7_d517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_aace_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_2236_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_98a9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_2236_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_98a9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_2236_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_98a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_2236_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_98a9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_2236_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_98a9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_2236_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_98a9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1447_c7_2236_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_98a9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1447_c7_2236_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_98a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1452_c11_9d7d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1452_c11_9d7d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1452_c11_9d7d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1452_c11_9d7d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1452_c11_9d7d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1452_c11_9d7d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1452_c11_9d7d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1452_c11_9d7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1455_c11_3037_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1455_c11_3037_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1455_c11_3037_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1455_c11_3037_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1455_c11_3037_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1455_c11_3037_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1455_c11_3037_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1455_c11_3037_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_ab13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_a9ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_ab13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_a9ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_ab13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_a9ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_ab13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_a9ac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1461_c7_ab13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_a9ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_ef7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_1af9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_ef7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_1af9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_ef7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_1af9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_ef7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_1af9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1e32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_1316_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1e32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_1316_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1456_c3_acc2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1456_l1448_DUPLICATE_8d32_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1449_c3_43cc_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1456_l1448_DUPLICATE_8d32_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1461_c7_ab13_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1465_c24_b75e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1455_l1447_l1452_l1438_l1444_DUPLICATE_d17f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1455_l1447_l1452_l1438_l1444_DUPLICATE_d17f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1455_l1447_l1452_l1438_l1444_DUPLICATE_d17f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1455_l1447_l1452_l1438_l1444_DUPLICATE_d17f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1455_l1447_l1452_l1438_l1444_DUPLICATE_d17f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1455_l1447_l1452_l1471_l1444_l1461_l1467_DUPLICATE_0e64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1455_l1447_l1452_l1471_l1444_l1461_l1467_DUPLICATE_0e64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1455_l1447_l1452_l1471_l1444_l1461_l1467_DUPLICATE_0e64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1455_l1447_l1452_l1471_l1444_l1461_l1467_DUPLICATE_0e64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_ab13_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1455_l1447_l1452_l1471_l1444_l1461_l1467_DUPLICATE_0e64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_ef7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1455_l1447_l1452_l1471_l1444_l1461_l1467_DUPLICATE_0e64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1e32_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1455_l1447_l1452_l1471_l1444_l1461_l1467_DUPLICATE_0e64_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1447_l1452_l1438_l1444_l1461_DUPLICATE_e550_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1447_l1452_l1438_l1444_l1461_DUPLICATE_e550_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1447_l1452_l1438_l1444_l1461_DUPLICATE_e550_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1447_l1452_l1438_l1444_l1461_DUPLICATE_e550_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_ab13_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1447_l1452_l1438_l1444_l1461_DUPLICATE_e550_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1444_l1447_l1455_l1452_DUPLICATE_9e94_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1444_l1447_l1455_l1452_DUPLICATE_9e94_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1444_l1447_l1455_l1452_DUPLICATE_9e94_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1444_l1447_l1455_l1452_DUPLICATE_9e94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1455_l1447_l1452_l1438_l1471_l1444_l1467_DUPLICATE_c444_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1455_l1447_l1452_l1438_l1471_l1444_l1467_DUPLICATE_c444_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1455_l1447_l1452_l1438_l1471_l1444_l1467_DUPLICATE_c444_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1455_l1447_l1452_l1438_l1471_l1444_l1467_DUPLICATE_c444_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1455_l1447_l1452_l1438_l1471_l1444_l1467_DUPLICATE_c444_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_ef7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1455_l1447_l1452_l1438_l1471_l1444_l1467_DUPLICATE_c444_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1e32_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1455_l1447_l1452_l1438_l1471_l1444_l1467_DUPLICATE_c444_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1455_l1467_DUPLICATE_8359_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_ef7b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1455_l1467_DUPLICATE_8359_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1455_l1447_l1452_l1438_l1444_l1467_DUPLICATE_0094_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1455_l1447_l1452_l1438_l1444_l1467_DUPLICATE_0094_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1455_l1447_l1452_l1438_l1444_l1467_DUPLICATE_0094_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1455_l1447_l1452_l1438_l1444_l1467_DUPLICATE_0094_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1455_l1447_l1452_l1438_l1444_l1467_DUPLICATE_0094_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_ef7b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1455_l1447_l1452_l1438_l1444_l1467_DUPLICATE_0094_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l1459_c32_3777] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1459_c32_3777_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1459_c32_3777_left;
     BIN_OP_GT_uxn_opcodes_h_l1459_c32_3777_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1459_c32_3777_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1459_c32_3777_return_output := BIN_OP_GT_uxn_opcodes_h_l1459_c32_3777_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1456_c3_acc2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1456_c3_acc2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1456_c3_acc2_left;
     BIN_OP_OR_uxn_opcodes_h_l1456_c3_acc2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1456_c3_acc2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1456_c3_acc2_return_output := BIN_OP_OR_uxn_opcodes_h_l1456_c3_acc2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1461_c7_ab13] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_ab13_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_ab13_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_ab13_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_ab13_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_ab13_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_ab13_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_ab13_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_ab13_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1471_c7_1e32] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1e32_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1e32_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1e32_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1e32_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1e32_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1e32_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1e32_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1e32_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1467_c7_ef7b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_ef7b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_ef7b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_ef7b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_ef7b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_ef7b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_ef7b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_ef7b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_ef7b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1455_c7_8ac5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1449_c3_43cc] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1449_c3_43cc_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1449_c3_43cc_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1449_c3_43cc_return_output := CONST_SL_8_uxn_opcodes_h_l1449_c3_43cc_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1469_c24_41ba] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1469_c24_41ba_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1469_c34_bf5e_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1438_c1_d0fc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1438_c1_d0fc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1438_c1_d0fc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1438_c1_d0fc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1438_c1_d0fc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1438_c1_d0fc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1438_c1_d0fc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1438_c1_d0fc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1438_c1_d0fc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1471_c7_1e32] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1e32_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1e32_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1e32_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1e32_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1e32_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1e32_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1e32_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1e32_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1459_c32_1421_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1459_c32_3777_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1456_c3_acc2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_ef7b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1469_c24_41ba_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1449_c3_43cc_return_output;
     VAR_printf_uxn_opcodes_h_l1439_c3_6291_uxn_opcodes_h_l1439_c3_6291_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1438_c1_d0fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_ef7b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1e32_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_ab13_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_ef7b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1e32_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_ab13_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_ef7b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1467_c7_ef7b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_ef7b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_ef7b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_ef7b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_ef7b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_ef7b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_ef7b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_ef7b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_ef7b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1461_c7_ab13] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_ab13_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_ab13_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_ab13_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_ab13_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_ab13_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_ab13_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_ab13_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_ab13_return_output;

     -- printf_uxn_opcodes_h_l1439_c3_6291[uxn_opcodes_h_l1439_c3_6291] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1439_c3_6291_uxn_opcodes_h_l1439_c3_6291_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1439_c3_6291_uxn_opcodes_h_l1439_c3_6291_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1455_c7_8ac5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1467_c7_ef7b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_ef7b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_ef7b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_ef7b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_ef7b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_ef7b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_ef7b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_ef7b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_ef7b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1455_c7_8ac5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond <= VAR_t16_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond;
     t16_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue;
     t16_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output := t16_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1452_c7_ae7d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output;

     -- MUX[uxn_opcodes_h_l1459_c32_1421] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1459_c32_1421_cond <= VAR_MUX_uxn_opcodes_h_l1459_c32_1421_cond;
     MUX_uxn_opcodes_h_l1459_c32_1421_iftrue <= VAR_MUX_uxn_opcodes_h_l1459_c32_1421_iftrue;
     MUX_uxn_opcodes_h_l1459_c32_1421_iffalse <= VAR_MUX_uxn_opcodes_h_l1459_c32_1421_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1459_c32_1421_return_output := MUX_uxn_opcodes_h_l1459_c32_1421_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1467_c7_ef7b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1467_c7_ef7b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_ef7b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1467_c7_ef7b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_ef7b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1467_c7_ef7b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_ef7b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_ef7b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1467_c7_ef7b_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue := VAR_MUX_uxn_opcodes_h_l1459_c32_1421_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_ab13_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_ef7b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_ab13_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_ef7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_ab13_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1461_c7_ab13_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1467_c7_ef7b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1461_c7_ab13] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1461_c7_ab13_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1461_c7_ab13_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1461_c7_ab13_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1461_c7_ab13_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1461_c7_ab13_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1461_c7_ab13_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1461_c7_ab13_return_output := result_stack_value_MUX_uxn_opcodes_h_l1461_c7_ab13_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1461_c7_ab13] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_ab13_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_ab13_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_ab13_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_ab13_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_ab13_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_ab13_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_ab13_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_ab13_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1447_c7_2236] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_2236_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_2236_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_2236_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_2236_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1452_c7_ae7d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1461_c7_ab13] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_ab13_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_ab13_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_ab13_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_ab13_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_ab13_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_ab13_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_ab13_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_ab13_return_output;

     -- t16_MUX[uxn_opcodes_h_l1452_c7_ae7d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond;
     t16_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue;
     t16_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output := t16_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1455_c7_8ac5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1455_c7_8ac5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_ab13_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_2236_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_ab13_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1461_c7_ab13_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1452_c7_ae7d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1455_c7_8ac5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1444_c7_d517] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_d517_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_d517_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_d517_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_d517_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1452_c7_ae7d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1455_c7_8ac5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output;

     -- t16_MUX[uxn_opcodes_h_l1447_c7_2236] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1447_c7_2236_cond <= VAR_t16_MUX_uxn_opcodes_h_l1447_c7_2236_cond;
     t16_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue;
     t16_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1447_c7_2236_return_output := t16_MUX_uxn_opcodes_h_l1447_c7_2236_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1455_c7_8ac5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1455_c7_8ac5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1455_c7_8ac5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1455_c7_8ac5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output := result_stack_value_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1447_c7_2236] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_2236_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_2236_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_2236_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_2236_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_2236_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_d517_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1455_c7_8ac5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1447_c7_2236_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1438_c2_3085] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1438_c2_3085_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1438_c2_3085_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1438_c2_3085_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1438_c2_3085_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1452_c7_ae7d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1444_c7_d517] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1444_c7_d517_cond <= VAR_t16_MUX_uxn_opcodes_h_l1444_c7_d517_cond;
     t16_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue;
     t16_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1444_c7_d517_return_output := t16_MUX_uxn_opcodes_h_l1444_c7_d517_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1452_c7_ae7d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1452_c7_ae7d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_ae7d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_ae7d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_ae7d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1447_c7_2236] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_2236_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_2236_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_2236_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_2236_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1447_c7_2236] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_2236_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_2236_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_2236_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_2236_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1444_c7_d517] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_d517_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_d517_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_d517_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_d517_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_d517_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_2236_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_2236_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1452_c7_ae7d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1444_c7_d517_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1438_c2_3085] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1438_c2_3085_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1438_c2_3085_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1438_c2_3085_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1438_c2_3085_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1444_c7_d517] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_d517_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_d517_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_d517_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_d517_return_output;

     -- t16_MUX[uxn_opcodes_h_l1438_c2_3085] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1438_c2_3085_cond <= VAR_t16_MUX_uxn_opcodes_h_l1438_c2_3085_cond;
     t16_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue;
     t16_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1438_c2_3085_return_output := t16_MUX_uxn_opcodes_h_l1438_c2_3085_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1447_c7_2236] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_2236_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_2236_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_2236_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_2236_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1444_c7_d517] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_d517_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_d517_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_d517_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_d517_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1447_c7_2236] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_2236_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_2236_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_2236_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_2236_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1447_c7_2236] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1447_c7_2236_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1447_c7_2236_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1447_c7_2236_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1447_c7_2236_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1447_c7_2236_return_output := result_stack_value_MUX_uxn_opcodes_h_l1447_c7_2236_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_2236_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_2236_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_d517_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_d517_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1447_c7_2236_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1438_c2_3085_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1444_c7_d517] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_d517_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_d517_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_d517_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_d517_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1438_c2_3085] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1438_c2_3085_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1438_c2_3085_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1438_c2_3085_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1438_c2_3085_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1438_c2_3085] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1438_c2_3085_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1438_c2_3085_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1438_c2_3085_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1438_c2_3085_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1444_c7_d517] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_d517_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_d517_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_d517_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_d517_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1444_c7_d517] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1444_c7_d517_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_d517_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_d517_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_d517_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_d517_return_output := result_stack_value_MUX_uxn_opcodes_h_l1444_c7_d517_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_d517_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_d517_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_d517_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1438_c2_3085] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1438_c2_3085_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1438_c2_3085_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1438_c2_3085_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1438_c2_3085_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1438_c2_3085] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1438_c2_3085_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1438_c2_3085_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1438_c2_3085_return_output := result_stack_value_MUX_uxn_opcodes_h_l1438_c2_3085_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1438_c2_3085] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1438_c2_3085_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1438_c2_3085_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1438_c2_3085_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1438_c2_3085_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1438_c2_3085_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1438_c2_3085_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1476_l1434_DUPLICATE_9b8c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1476_l1434_DUPLICATE_9b8c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_28d7(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1438_c2_3085_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1438_c2_3085_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1438_c2_3085_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1438_c2_3085_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1438_c2_3085_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1438_c2_3085_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1438_c2_3085_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1476_l1434_DUPLICATE_9b8c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1476_l1434_DUPLICATE_9b8c_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
